#Exam Programs Installer
print("-----Exam Programs Installer-----")

winget install --id Python.Python.3 --scope machine
python -m pip install pandas
python -m pip install matplotlib
winget install --id TheDocumentFoundation.LibreOffice --scope machine
winget install -- id JGraph.Draw --scope machine

winget list --id python.Python.3
winget list --id TheDocumentFoundation.LibreOffice
winget list --id JGraph.Draw