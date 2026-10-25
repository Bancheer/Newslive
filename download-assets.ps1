# NewsLive: download design assets from Figma into assets/ (run from the project folder)
# PowerShell:  powershell -ExecutionPolicy Bypass -File .\download-assets.ps1
$ErrorActionPreference = "Continue"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$list = @(
  @("icons/logo.svg", "https://www.figma.com/api/mcp/asset/edac9c68-681e-411f-ac34-c8cd41d8b971/88bcc.svg"),
  @("icons/clock-deco.svg", "https://www.figma.com/api/mcp/asset/531afd3b-ae02-4fb2-ae01-4b818898057a/b44f8.svg"),
  @("icons/header-icons.svg", "https://www.figma.com/api/mcp/asset/2ac2c4b3-a9e5-4500-87e1-178f4edcec67/f4ca7.svg"),
  @("icons/arrow.svg", "https://www.figma.com/api/mcp/asset/c0ed4ef7-e14b-47f4-a9ba-32fc1e67b8b5/9fd25.svg"),
  @("icons/arrow-2.svg", "https://www.figma.com/api/mcp/asset/47918284-e7f7-4a3e-90f0-b81c535038e0/dab30.svg"),
  @("icons/best-of-entertainment.svg", "https://www.figma.com/api/mcp/asset/d7206ce5-89e7-4e91-8298-e47def223d28/05066.svg"),
  @("icons/girls-trip-figure.svg", "https://www.figma.com/api/mcp/asset/998d5b08-f0b5-4eee-aec5-d4e521baa94c/d4870.svg"),
  @("icons/arrow-orange-lg.svg", "https://www.figma.com/api/mcp/asset/998d5b08-f0b5-4eee-aec5-d4e521baa94c/fb880.svg"),
  @("icons/star.svg", "https://www.figma.com/api/mcp/asset/84be4f14-f2ec-43d1-af91-3c6349d4e66a/60362.svg"),
  @("icons/arrow-sm.svg", "https://www.figma.com/api/mcp/asset/84be4f14-f2ec-43d1-af91-3c6349d4e66a/6dff8.svg"),
  @("icons/news-icon.svg", "https://www.figma.com/api/mcp/asset/c5507b90-0fc6-4396-9575-b229d889880f/bf11c.svg"),
  @("icons/live-news.svg", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/0664b.svg"),
  @("icons/live-dot.svg", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/2db9e.svg"),
  @("icons/calendar.svg", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/6d30d.svg"),
  @("icons/megaphone.svg", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/28ea5.svg"),
  @("icons/dash.svg", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/7a115.svg"),
  @("icons/logo-light.svg", "https://www.figma.com/api/mcp/asset/86ae16b8-ce44-4f78-bade-220420e15a18/555d8.svg"),
  @("icons/social-1.svg", "https://www.figma.com/api/mcp/asset/86ae16b8-ce44-4f78-bade-220420e15a18/0de0c.svg"),
  @("icons/social-2.svg", "https://www.figma.com/api/mcp/asset/86ae16b8-ce44-4f78-bade-220420e15a18/015b2.svg"),
  @("icons/social-3.svg", "https://www.figma.com/api/mcp/asset/86ae16b8-ce44-4f78-bade-220420e15a18/39df4.svg"),
  @("img/latest-1.png", "https://www.figma.com/api/mcp/asset/16fb53bd-074d-496d-b39e-f71a1f0aec70/f2724.png"),
  @("img/latest-2.png", "https://www.figma.com/api/mcp/asset/16fb53bd-074d-496d-b39e-f71a1f0aec70/47d45.png"),
  @("img/news-of-day.png", "https://www.figma.com/api/mcp/asset/416f295f-2051-4084-be0c-1f42c23e1656/7de11.png"),
  @("img/ruth.png", "https://www.figma.com/api/mcp/asset/542a948d-d037-4a53-a030-c2eb5d86aac0/59fae.png"),
  @("img/hulu.png", "https://www.figma.com/api/mcp/asset/542a948d-d037-4a53-a030-c2eb5d86aac0/017bc.png"),
  @("img/fashion.png", "https://www.figma.com/api/mcp/asset/47918284-e7f7-4a3e-90f0-b81c535038e0/d649e.png"),
  @("img/trending-main.png", "https://www.figma.com/api/mcp/asset/c5507b90-0fc6-4396-9575-b229d889880f/6813d.png"),
  @("img/trending-1.png", "https://www.figma.com/api/mcp/asset/c5507b90-0fc6-4396-9575-b229d889880f/3e7d0.png"),
  @("img/quotes.png", "https://www.figma.com/api/mcp/asset/c5507b90-0fc6-4396-9575-b229d889880f/5d8c2.png"),
  @("img/innov-1.png", "https://www.figma.com/api/mcp/asset/84be4f14-f2ec-43d1-af91-3c6349d4e66a/bd09e.png"),
  @("img/live-1.png", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/c51dd.png"),
  @("img/live-2.png", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/7be60.png"),
  @("img/live-3.png", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/0463b.png"),
  @("img/live-4.png", "https://www.figma.com/api/mcp/asset/b26681e9-f8e2-435b-b6f5-c3e03ff7e433/326fc.png"),
  @("img/directors.png", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/e0510.png"),
  @("img/avatar-1.png", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/76abf.png"),
  @("img/avatar-2.png", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/4c0a3.png"),
  @("img/avatar-3.png", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/364a5.png"),
  @("img/avatar-4.png", "https://www.figma.com/api/mcp/asset/68364a74-4105-41a0-9d8a-b65fae6d4c02/d9560.png"),
  @("img/partner-1.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/aa682.png"),
  @("img/partner-2.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/71172.png"),
  @("img/partner-3.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/3494d.png"),
  @("img/partner-4.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/f9f94.png"),
  @("img/partner-5.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/8e1ec.png"),
  @("img/partner-6.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/254b4.png"),
  @("img/partner-7.png", "https://www.figma.com/api/mcp/asset/aeab0049-5622-42cc-8c5c-8b681b367b2c/b1d43.png"),
  @("img/disney.png", "https://www.figma.com/api/mcp/asset/b5755b15-fb8c-4562-b51d-242a64bf6fe3.png"),
  @("img/trending-2.png", "https://www.figma.com/api/mcp/asset/d5130679-3dda-41a6-9edb-0fe550a40ddb.png"),
  @("img/innovation-main.png", "https://www.figma.com/api/mcp/asset/bb0d64b2-4d96-40be-8780-116ac4ffcbff.png"),
  @("img/innovation-lines.png", "https://www.figma.com/api/mcp/asset/ce90fe82-2f80-4dfb-9740-9abe82a64888.png"),
  @("img/innov-2.png", "https://www.figma.com/api/mcp/asset/42b77463-3e18-49e4-9319-b597dac2533a.png"),
  @("img/terry.png", "https://www.figma.com/api/mcp/asset/8cd979ee-7a28-4ab0-a58e-83e3a77a6ee3.png"),
  @("img/jackson.png", "https://www.figma.com/api/mcp/asset/9d5248c1-c751-4032-aa88-d9da3689e871.png"),
  @("img/jane.png", "https://www.figma.com/api/mcp/asset/c8f2dbf9-22b4-4c17-afc1-7817b764d30e.png"),
  @("icons/subscribe-deco.svg", "https://www.figma.com/api/mcp/asset/9f003843-579f-4ed4-afc0-c4eaca31ef87.svg")
)
foreach ($a in $list) {
  $dest = Join-Path $root ("assets/" + $a[0])
  New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
  try { Invoke-WebRequest -Uri $a[1] -OutFile $dest -UseBasicParsing; Write-Host "OK  " $a[0] }
  catch { Write-Host "FAIL" $a[0] $_.Exception.Message -ForegroundColor Red }
}
Write-Host "Done."
