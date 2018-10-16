#
Sub Shading 
ตั้งชื่อ macro ว่า  Shading	
	For i = 3 To 10
	อ้างแถวข้อมูลเริ่มต้นจาก 3 ถึงแถวที่ 10
	Range("actReg").Value = Range("ShadingMacros!A" & i).Value
	อ้างอิงค่าจาก เซลล์ ชื่อ actReg เท่ากับ  Sheet ที่ชื่อ ShadingMacros คอลัมน์ A
	ActiveSheet.Shapes(Range("actReg").Value).Select
	โดยเลือก Shape ใน Sheet ที่กำลังเปิดจาก โดยอ้างอิงชื่อ Shape ที่ตรงกับ เซลล์ ชื่อ actReg
	Selection.ShapeRange.Fill.ForeColor.RGB = Range(Range("actRegCode").Value).Interior.Color
	เติมสีใน Shape ตามค่าที่ได้จากเซลล์ ชื่อ actRegCode
	
	
	Next i
	
	Range("A1").Select
	เริ่มเปลี่ยนสี  Shape จากเซลล์  A1 ลงไป
End Sub
