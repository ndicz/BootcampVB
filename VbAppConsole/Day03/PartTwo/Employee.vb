Namespace PartTwo
    Public Class Employee
        Private _empId As Integer
        Private _firstName, _lastName As String
        Private _joinDate As DateTime
        Private _basicSalary As Double
        Private _totalSalary As Double

        'declare constructor
        Public Sub New(empId As Integer, firstName As String, lastName As String, joinDate As Date, basicSalary As Double)
            _empId = empId
            _firstName = firstName
            _lastName = lastName
            _joinDate = joinDate
            _basicSalary = basicSalary
            _totalSalary = basicSalary
        End Sub

        'constructor overloading
        Public Sub New(firstName As String, lastName As String, joinDate As Date, basicSalary As Double)
            _empId = New Random().Next(1, 10) 'random _id
            _firstName = firstName
            _lastName = lastName
            _joinDate = joinDate
            _basicSalary = basicSalary
            _totalSalary = basicSalary
        End Sub

        Public Property EmpId As Integer
            Get
                Return _empId
            End Get
            Set(value As Integer)
                _empId = value
            End Set
        End Property

        Public Property FirstName As String
            Get
                Return _firstName
            End Get
            Set(value As String)
                _firstName = value
            End Set
        End Property

        Public Property LastName As String
            Get
                Return _lastName
            End Get
            Set(value As String)
                _lastName = value
            End Set
        End Property

        Public Property JoinDate As Date
            Get
                Return _joinDate
            End Get
            Set(value As Date)
                _joinDate = value
            End Set
        End Property

        Public Overridable Property BasicSalary As Double
            Get
                Return _basicSalary
            End Get
            Set(value As Double)
                _basicSalary = value
            End Set
        End Property

        Public Property TotalSalary As Double
            Get
                Return _totalSalary
            End Get
            Set(value As Double)
                _totalSalary = value
            End Set
        End Property

        Public Overrides Function ToString() As String
            Return $"EmpId : {EmpId}, firstName : {FirstName}, lastName : {LastName}, joinDate : {JoinDate}, basicSalary : {BasicSalary}"
        End Function
    End Class
End Namespace