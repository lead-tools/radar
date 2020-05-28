
$1CPath = "C:\Program Files\1cv8\8.3.13.1809\bin\1cv8.exe"
if (-not (Test-Path $1CPath)) {
    $1CPath = 'C:\Program Files\1cv8\common\1cestart.exe'
}
if (-not (Test-Path $1CPath)) {
    $1CPath = 'C:\Program Files (x86)\1cv8\common\1cestart.exe'
}

function complete($percent, $activity) {
    Write-Progress -Activity $activity -Status "Прогресс:" -PercentComplete $percent
}

$list = @{
    НеиспользуемаяПеременная    = "Плагины", "plugins\НеиспользуемаяПеременная\src"
    ВставкаКоллекцииВСамуСебя   = "Плагины", "plugins\ВставкаКоллекцииВСамуСебя\src"
    БесполезныйПереборКоллекции = "Плагины", "plugins\БесполезныйПереборКоллекции\src"
    ВложенныйТернарныйОператор  = "Плагины", "plugins\ВложенныйТернарныйОператор\src"
    ЗапросВЦикле                = "Плагины", "plugins\ЗапросВЦикле\src"
}

function Cmd_epf ($command, $description){

    complete 0 $description

    $x = 0; $dx = 100 / $list.Count
    foreach ($item in $list.GetEnumerator()) {
        $ArgList =  "DESIGNER", "/DumpResult designer_result.txt", "/Out designer_out.txt",
                    "/DisableStartupDialogs",
                    "/F .\.tempdb\",
                    "/$command `".\$($item.Value[1])\$($item.Name).xml`" `".\bin\$($item.Value[0])\$($item.Name).epf`""
        Start-Process $1CPath -ArgumentList $ArgList -Wait
        if ((Get-Content .\designer_result.txt) -ne '0') {
            Get-Content .\designer_out.txt
        }
        $x += $dx
        complete $x $description
    }

}