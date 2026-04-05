' VBScript to convert text file encoding from UTF-8 to GBK
' Usage: cscript convert-to-gbk.vbs input.bat output.bat

Dim inputFile, outputFile, content, stream

If WScript.Arguments.Count < 2 Then
    WScript.Echo "Usage: cscript convert-to-gbk.vbs input.bat output.bat"
    WScript.Echo "Example: cscript convert-to-gbk.vbs init-git.bat init-git-gbk.bat"
    WScript.Quit 1
End If

inputFile = WScript.Arguments(0)
outputFile = WScript.Arguments(1)

' Read UTF-8 file
Set stream = CreateObject("ADODB.Stream")
stream.Type = 2 ' Text
stream.Charset = "utf-8"
stream.Open
stream.LoadFromFile inputFile
content = stream.ReadText
stream.Close

' Write as GBK
Set stream = CreateObject("ADODB.Stream")
stream.Type = 2 ' Text
stream.Charset = "gbk"
stream.Open
stream.WriteText content
stream.SaveToFile outputFile, 2 ' adSaveCreateOverWrite
stream.Close

WScript.Echo "Converted " & inputFile & " to " & outputFile & " (GBK encoding)"
