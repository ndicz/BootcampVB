Module No1
    '(TahunHari). Buat program inputan dalam satuan menit (contoh : 1.000.000.000), lalu tampilkan
    'jumlah tahun dan hari. Diasumsikan 1 tahun = 365 hari.
    'Input bilangan : 1000000000
    'Output: 1000000000 = 1902 tahun, 214 hari

    Sub TahunHari()
        Dim inputMinutes As UInteger
        Const daysInYear As Int32 = 365
        Const minsInDay As Int32 = 60 * 24

        Console.Write("Input Bilangan : ")
        inputMinutes = Console.ReadLine()

        Dim totalDays As UInteger = inputMinutes \ minsInDay
        Dim totalYears As UInteger = totalDays \ daysInYear
        Dim modDays As UInteger = totalDays Mod daysInYear

        Console.WriteLine($"Output : {inputMinutes} = {totalYears} tahun, {modDays} hari")
    End Sub
End Module
