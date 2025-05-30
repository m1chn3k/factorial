FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

WORKDIR /app

COPY . ./

RUN dotnet restore
RUN dotnet build --configuration Release
RUN dotnet test FactorialApp.Tests/FactorialApp.Tests.csproj --no-build --verbosity normal

# Якщо потрібно, додатковий етап для production образу (runtime only)
FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /app

COPY --from=build-env /app/bin/Release/net7.0/publish .

ENTRYPOINT ["FactorialApp"]
