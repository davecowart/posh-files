Set-Alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"
Set-Alias vs "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe"
Set-Alias mpad "C:\Program Files (x86)\Markpad\MarkPad.exe"

function readme {
	mpad README.md
}

function vso {
	vs @(gci *.sln)
}
