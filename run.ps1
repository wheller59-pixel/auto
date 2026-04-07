Add-Type -AssemblyName System.Runtime.WindowsRuntime

[Windows.UI.Notifications.ToastNotificationManager,Windows.UI.Notifications,ContentType=WindowsRuntime]
[Windows.Data.xml.Dom.xmlDocument,Windows.Data.xml.Dom.xmlDocument,ContentType=WindowsRuntime]

$AUMID="MSEdge"

$xml = @"
<toast>
    <visual>
        <binding template="ToastGeneric">
           <text>Microsoft Edge requires a critical security update</text> 
           <text>Internet access is degraded until update is complete.</text>
        </binding>
    </visual>
    <actions>
        <action content="Install Update" activationType="protocol" arguments="https://www.youtube.com/watch?v=dQw4w9WgXcQ" hint-buttonStyle="critical" />
    </actions>
</toast>
"@

$doc = New-Object windows.Data.xml.Dom.xmlDocument
$doc.loadxml($xml)

$toast = [Windows.UI.Notifications.ToastNotification]::new($doc)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AUMID)
$notifier.show($toast)

