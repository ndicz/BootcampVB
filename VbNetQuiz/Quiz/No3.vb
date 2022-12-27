Imports System.IO

Module No3
    '(Simulasi ATM). Buat program simulasi ATM, dimana user menginput pin password pertamakali.
    'Jika pin password benar, maka dilanjutkan ke input berikutnya yaitu jumlah uang yang akan
    'diambil. ATM hanya memiliki pecahan $10, $5 dan $1. Misal jika user input uang yang akan
    'diambil $36, maka program akan menampilkan output : “$10 = 3 lembar, $5=1 lembar, $=1
    'lembar”. Jika pin salah, maka tampilkan “kesempatan 2 kali lagi untuk mencoba”. Jika ketiga kali
    'nya salah, tampilkan “pin anda di lock”.

    Sub MoneyWithdraw(n As Integer)
        Dim moneyRemain As Integer
        Const dollarTen = 10
        Const dollarFive = 5
        Const dollarOne = 1

        Console.WriteLine($"Jumlah uang yang diambil ${n}")

        Dim quotientMoney = Math.DivRem(n, dollarTen, moneyRemain)
        Console.Write($"$10 = {quotientMoney} lembar, ")

        quotientMoney = Math.DivRem(moneyRemain, dollarFive, moneyRemain)
        Console.Write($"$5 = {quotientMoney} lembar, ")

        quotientMoney = Math.DivRem(moneyRemain, dollarOne, moneyRemain)
        Console.WriteLine($"$1 = {quotientMoney} lembar")
    End Sub

    Sub SimulasiATM(passwordPIN As String)
        Dim loginChance = 3
        Dim moneyNominal As Integer
        Dim nextTransaction As Char

        Do Until loginChance = 0
            Console.Write("Masukkan 6-digit PIN : ")
            Dim inputPIN As String = Console.ReadLine()

            If passwordPIN = inputPIN Then
                Console.Clear()
                Console.WriteLine("PIN anda benar!")

                Console.Write("Nominal Uang yang akan diambil $ : ")
                moneyNominal = Console.ReadLine()

                MoneyWithdraw(moneyNominal)

                Console.Write("Apakah anda ingin melanjutkan transaksi? [Y/n] : ")
                nextTransaction = Console.ReadLine()

                If (nextTransaction = "Y") Then
                    Console.Clear()
                    Continue Do
                End If

                Exit Do
            Else
                Console.Clear()
                Console.WriteLine("PIN yang anda masukkan salah!")
                loginChance -= 1

                If loginChance Then
                    Console.WriteLine($"Kesempatan {loginChance} kali lagi untuk mencoba!")
                    Continue Do
                End If

                Console.WriteLine("PIN anda di lock")
            End If
        Loop
    End Sub
End Module
