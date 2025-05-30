FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

COPY *.sln .
COPY FactorialApp/*.csproj ./FactorialApp/
COPY FactorialApp.Tests/*.csproj ./FactorialApp.Tests/
RUN dotnet restore

COPY FactorialApp/. ./FactorialApp/
COPY FactorialApp.Tests/. ./FactorialApp.Tests/

RUN dotnet build --configuration Release

RUN dotnet publish FactorialApp/FactorialApp.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "FactorialApp.dll"]
