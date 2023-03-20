// The following is an index of unique and special featues of the Kotlin language
fun main (){
    // 1. Kotlin has a feature called "Null Safety" which means that you can't assign null to a variable unless you explicitly declare it as nullable

    // This will throw an error
    // null_variable = null

    // This will not throw an error
    var null_variable: String? = null

    // Showing the null variable on the console
    println(null_variable)

    // 2. Kotlin has a feature called "Smart Casts" which means that you don't have to explicitly cast a variable to a specific type

    // This will throw an error
    var cast_variable_int = 10


    // This will not throw an error
    var cast_variable_str = 10.toString()

    // Showing the types of the variables on the console
    println(cast_variable_int::class.simpleName)
    println(cast_variable_str::class.simpleName)

    // 3. Kotlin has a feature called "Data Classes" which means that you can create a class with a single line of code

    // This will throw an error
    // class DataClass {
    //     var name: String
    //     var age: Int
    // }

    // This will not throw an error
    data class DataClass(var name: String, var age: Int)

    // Creating an instance of the data class
    var data_class_instance = DataClass("John Doe", 20)

    println(data_class_instance)
}