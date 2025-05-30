FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY *.sln ./
COPY FactorialApp/*.csproj ./FactorialApp/
COPY FactorialApp.Tests/*.csproj ./FactorialApp.Tests/

RUN dotnet restore

COPY FactorialApp/. ./FactorialApp/
COPY FactorialApp.Tests/. ./FactorialApp.Tests/

WORKDIR /app/FactorialApp
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/FactorialApp/out ./

ENTRYPOINT ["dotnet", "FactorialApp.dll"]
