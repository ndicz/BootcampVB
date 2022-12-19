Namespace PartTwo
    Public Class Programmer
        Inherits Employee

        Private _transportation As Double

        Public Sub New(firstName As String, lastName As String, joinDate As Date, basicSalary As Double, Optional transportation As Double = Nothing)
            MyBase.New(firstName, lastName, joinDate, basicSalary)
            _transportation = transportation
            MyBase.TotalSalary += _transportation
        End Sub

        Public Overrides Property BasicSalary As Double
            Get
                Return MyBase.BasicSalary
            End Get
            Set(value As Double)
                MyBase.BasicSalary = value
                TotalSalary = value + Transportation
            End Set
        End Property

        Public Property Transportation As Double
            Get
                Return _transportation
            End Get
            Set(value As Double)
                _transportation = value
                MyBase.TotalSalary = BasicSalary + value
            End Set
        End Property

        Public Overrides Function ToString() As String
            Return $"{MyBase.ToString()}, tjTransport : {Transportation}, TotalSalary: {MyBase.TotalSalary}"
        End Function
    End Class
End Namespace