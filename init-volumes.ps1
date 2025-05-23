
Param
(
    [parameter()]
    [Alias("medp")]
    [string]$mongoExternalDataPath
)

[Console]::ResetColor()
Write-Host "`n"

if ($verbose) {
    $VerbosePreference = "Continue"
}
$verbose = $VerbosePreference -eq "continue"

# mongo volume initialization script

$volume_name = 'mongo_data'
$results = & docker volume inspect --format '{{.Name}}' $volume_name

if ($results) {
    Write-Host ("{0} volume ready to go" -f $volume_name) -ForegroundColor Green
}
else {
    Write-Host ("create {0} volume..." -f $volume_name) -ForegroundColor Yellow
    
    docker volume create $volume_name

    if ($mongoExternalDataPath) {
        Write-Host ("populate {0} volume..." -f $volume_name) -ForegroundColor Yellow
        
        docker container create --name dummy -v '$volume_name:/data/db hello-world'

        docker cp $mongoExternalDataPath. dummy:/data/db

        docker rm dummy
        docker rmi hello-world
    }
    Write-Host ("volume {0} created and ready to go" -f $volume_name) -ForegroundColor Green
}

$volume_name = 'mssql_data'
$results = & docker volume inspect --format '{{.Name}}' $volume_name 

if ($results) {
    Write-Host ("{0} volume ready to go" -f $volume_name) -ForegroundColor Green
}
else {
    Write-Host ("create {0} volume..." -f $volume_name) -ForegroundColor Yellow
    
    docker volume create $volume_name

    Write-Host ("volume {0} created and ready to go" -f $volume_name) -ForegroundColor Green
}

$volume_name = 'redis_data'
$results = & docker volume inspect --format '{{.Name}}' $volume_name 

if ($results) {
    Write-Host ("{0} volume ready to go" -f $volume_name) -ForegroundColor Green
}
else {
    Write-Host ("create {0} volume..." -f $volume_name) -ForegroundColor Yellow
    
    docker volume create $volume_name

    Write-Host ("volume {0} created and ready to go" -f $volume_name) -ForegroundColor Green
}

$volume_name = 'rabbit_data'
$results = & docker volume inspect --format '{{.Name}}' $volume_name 

if ($results) {
    Write-Host ("{0} volume ready to go" -f $volume_name) -ForegroundColor Green
}
else {
    Write-Host ("create {0} volume..." -f $volume_name) -ForegroundColor Yellow
    
    docker volume create $volume_name

    Write-Host ("volume {0} created and ready to go" -f $volume_name) -ForegroundColor Green
}

$volume_name = 'seq_data'
$results = & docker volume inspect --format '{{.Name}}' $volume_name 

if ($results) {
    Write-Host ("{0} volume ready to go" -f $volume_name) -ForegroundColor Green
}
else {
    Write-Host ("create {0} volume..." -f $volume_name) -ForegroundColor Yellow
    
    docker volume create $volume_name

    Write-Host ("volume {0} created and ready to go" -f $volume_name) -ForegroundColor Green
}

[Console]::ResetColor()
Write-Host "`n`n"