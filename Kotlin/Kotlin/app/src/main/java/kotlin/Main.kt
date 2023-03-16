data class Person(val name: String, val age: Int)
fun main() {
    val person_one = Person("Alice", 29)
    val person_two = Person("Bob", 31)
    println(person_one)
    println(person_two)
    println(person_one == person_two)
}