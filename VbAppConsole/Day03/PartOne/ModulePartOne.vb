Namespace PartOne
    Module ModulePartOne
        Sub InitEmployee()
            'create object employee without encapsulation
            Dim emp1 As New Employee With {
                .empId = 1,
                .firstName = "Mahendrata",
                .lastName = "Harpi",
                .joinDate = #12/15/2022 10:03:01 AM#,
                .basicSalary = 5_000_000
            }

            'display employee information
            Console.WriteLine(emp1.ToString())
            emp1.basicSalary = 4_500_000
            Console.WriteLine(emp1.ToString())
        End Sub
    End Module
End Namespace