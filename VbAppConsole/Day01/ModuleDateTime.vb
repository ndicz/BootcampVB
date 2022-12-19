Module ModuleDateTime
    Sub ShowDate()
        Dim date1 As Date = #12/15/2022 10:03:01 AM#
        Dim currentDate As Date = Date.Now
        Console.WriteLine("Time" & currentDate.ToString())


        Console.WriteLine("Date1  : " & date1)
        Console.WriteLine("currentDate  : " & currentDate)
        Console.WriteLine("yesterdayDate : " & currentDate.AddDays(-1))
        Console.WriteLine("tommorowDate : " & currentDate.AddDays(1))
        Console.WriteLine($"tommorowDatei : {currentDate.AddDays(1)}")

        Dim tanggal, bulan, tahun As Integer
        'tanggal = Day(currentDate)
        'bulan = Month(currentDate)
        'tahun = Year(currentDate)
        'cara lain
        tanggal = currentDate.Day
        bulan = currentDate.Month
        tahun = currentDate.Year
        Console.WriteLine("hari " & tanggal & " bulan " & bulan & " tahun " & tahun)
    End Sub
End Module
