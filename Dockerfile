﻿FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers

COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
EXPOSE 80
EXPOSE 443
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "Catalog.dll"]