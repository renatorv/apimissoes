# docker build -t renatorv/apimissoes .
# docker container run -p 8080:8080 --name apimissoes -d renatorv/apimissoes
# sobe a imagem para o Docker hub como privado => docker push renatorv/apimissoes:latest

##############################################################################################

# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/server /

# Resolveu o problema de não criar a pasta das imagens
# ver se realmente as imagens estão no container
COPY images/ /

# Start server.
EXPOSE 8080
CMD ["/server"]
