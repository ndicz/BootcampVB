Namespace PartTwo
    Public Class ITSupport
        Inherits Programmer

        Public Sub New(firstName As String, lastName As String, joinDate As Date, basicSalary As Double, Optional transportation As Double = Nothing)
            MyBase.New(firstName, lastName, joinDate, basicSalary, transportation)
        End Sub

    End Class

End Namespace
