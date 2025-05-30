FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY *.sln .
COPY FactorialApp/*.csproj ./FactorialApp/
COPY FactorialApp.Tests/*.csproj ./FactorialApp.Tests/

RUN dotnet restore

COPY FactorialApp/. ./FactorialApp/
COPY FactorialApp.Tests/. ./FactorialApp.Tests/

RUN dotnet build --configuration Release

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/FactorialApp/bin/Release/net7.0/publish ./

ENTRYPOINT ["dotnet", "FactorialApp.dll"]
