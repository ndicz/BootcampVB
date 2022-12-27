Imports System.Security.Permissions
Imports Microsoft.Win32.SafeHandles

Module No2
    '(ShioCalender). Buat program dengan inputan tahun lahir , lalu tampilkan dalam kalender shio,
    'seperti tahun monyet, kelinci, naga dan lainnya. Selisih antara tahun masehi dan kalender shio
    'adalah 12.(Hint : gunakan case)

    Sub ShioCalender()
        Dim shio() As String = {"monyet", "ayam", "anjing", "babi", "tikus", "kerbau", "harimau", "kelinci", "naga", "ular", "kuda", "kambing"}

        Console.Write("Enter tahun lahir : ")
        Dim dateOfBirth As UInt16 = Console.ReadLine()

        Dim yourShio As UInt16 = dateOfBirth Mod shio.Count

        Console.WriteLine($"Output : Anda lahir ditahun {shio(yourShio)}")
    End Sub

    'Select Case dateOfBirth Mod 12
    '    Case 0
    '        shio = "monyet"
    '    Case 1
    '        shio = "ayam"
    '    Case 2
    '        shio = "anjing"
    '    Case 3
    '        shio = "babi"
    '    Case 4
    '        shio = "tikus"
    '    Case 5
    '        shio = "kerbau"
    '    Case 6
    '        shio = "harimau"
    '    Case 7
    '        shio = "kelinci"
    '    Case 8
    '        shio = "naga"
    '    Case 9
    '        shio = "ular"
    '    Case 10
    '        shio = "kuda"
    '    Case 11
    '        shio = "kambing"
    '    Case Else
    '        Console.WriteLine("Tidak ada Shio")
    'End Select
End Module
