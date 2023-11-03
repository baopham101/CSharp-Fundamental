FROM mcr.microsoft.com/dotnet/core/sdk:6.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY Catalog/*.csproj ./Catalog/
RUN dotnet restore

# copy everything else and build app
COPY Catalog/. ./Catalog/
WORKDIR /app/Catalog
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/Catalog/out ./
ENTRYPOINT ["dotnet", "Catalog.dll"]