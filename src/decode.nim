import base64, os

let currentDir = getCurrentDir()
for filePath in walkFiles(currentDir & "/*"):
  let name = extractFilename(filePath)
  if name[0..<3]=="enc" and name != "decode.exe" and name != "handsome_ransom.exe":
    let encodedData = readFile(name)
    let decodedData = decode(encodedData)
    writeFile(name[3..<name.len], decodedData)
    removeFile(name)
