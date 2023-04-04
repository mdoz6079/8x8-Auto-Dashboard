$Scriptpath = "C:\Users\mdozier\Documents\PowerShell\SeleniumProjects"
Add-Type -Path "$Scriptpath\webdriver.dll"

$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver

$driver.Navigate().GoToUrl("https://sso.8x8.com/v2/login")

$driver.Manage().Window.Maximize()

$user = $driver.FindElement([OpenQA.Selenium.By]::Id("loginId"))

$user.SendKeys("email")

$user.SendKeys([OpenQA.Selenium.Keys]::Return)

Start-Sleep -Seconds 1

$password = $driver.FindElement([OpenQA.Selenium.By]::Id("password"))

$password.SendKeys("password")

$password.SendKeys([OpenQA.Selenium.Keys]::Return)

Start-Sleep -Seconds 3

$button = $driver.FindElement([OpenQA.Selenium.By]::Xpath('//*[@id="root"]/div/div[2]/div[2]/div[3]'))

$button.Click()

#Switching to new window
Start-Sleep -Seconds 2
  
$currentwindow = $driver.CurrentWindowHandle
$handles = $driver.WindowHandles


Foreach ($window in $handles) {
    if ($window -ne $currentwindow) {
        $driver.SwitchTo().Window($window)
        break
    }
}

Start-Sleep -Seconds 5

$button_side_menu = $driver.FindElement([OpenQA.Selenium.By]::Xpath('//*[@id="root"]/div/div[2]/aside/div/div[1]/span/span'))

$button_side_menu.Click()

$driver.Manage().Window.FullScreen()

$Program_Running = 1

#Refreshes Every 30 minutes


while ($Program_Running -eq 1) {
    Start-Sleep -Seconds 15
    $driver.Navigate().Refresh()
    $driver.Manage().Window.Maximize()
    Start-Sleep -Seconds 2
    $button_side_menu = $driver.FindElement([OpenQA.Selenium.By]::Xpath('//*[@id="root"]/div/div[2]/aside/div/div[1]/span/span'))
    $button_side_menu.Click()
    $driver.Manage().Window.FullScreen()

} 

