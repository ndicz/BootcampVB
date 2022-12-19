Namespace PartTwo
    Module ModulePartTwo
        Sub InitEmployee()
            'create object employee with encapsulation
            'Dim emp1 As New Employee(1, "Mahendrata", "Harpi", DateTime.Now, 5_000_000)
            'Dim emp2 As New Employee("Joko", "Mamat", DateTime.Now, 5_000_000)
            'Dim emp3 As New Employee("Tingkir", "Slamet", DateTime.Now, 5_000_000)

            ''display employee information
            'Console.WriteLine(emp1.ToString())
            'emp1.BasicSalary = 4_500_000
            'emp1.FirstName = "Choirul"
            'Console.WriteLine(emp1.ToString())
            'Console.WriteLine(emp2.ToString())
            'Console.WriteLine(emp3.ToString())

            'create object programmer 
            'Dim emp4 As New Programmer("Budi", "Budiman", DateTime.Now, 6_500_000)
            'Console.WriteLine(emp4.ToString())

            Dim emp5 As New Programmer("Aji", "Saka", DateTime.Now, 6_500_000, 500_000)
            Console.WriteLine(emp5.ToString())

            emp5.Transportation = 750_000
            Console.WriteLine(emp5.ToString())

            emp5.BasicSalary = 5_000_000
            Console.WriteLine(emp5.ToString())

            Console.WriteLine("---------------------------------")

            Dim emp6 As New ITSupport("Si Paling", "IT Support", DateTime.Now, 2_000_000, 650_000)
            Console.WriteLine(emp6.ToString())

            Console.WriteLine("-------------- Employee -------------------")

            Dim emp7 As New Employee("Employee", "Biasa", DateTime.Now, 2_000_000)
            Console.WriteLine(emp7.ToString())

        End Sub
    End Module
End Namespace