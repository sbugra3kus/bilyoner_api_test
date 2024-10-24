Feature: Sample Karate Test

  Scenario: Test GET Request
    Given url 'https://dummyapi.online/api/movies'
    When method GET
    Then status 200


  Scenario: Validate number of movie elements in the array
    Given url 'https://dummyapi.online/api/movies'
    When method GET
    Then status 200
    * def movies = response  // JSON yanıtını al
    * def elementCount = movies.length  // JSON dizisinin uzunluğunu al
    * print 'Number of movie elements:', elementCount
    * match elementCount == 100

  Scenario: Find and validate movie with id 84
    Given url 'https://dummyapi.online/api/movies'
    When method GET
    Then status 200
    * def movies = response  // JSON dizisini al
    * def movieWithId84 = movies.find(x => x.id == 84)  // id değeri 84 olan elemanı bul
    * def movieName = movieWithId84.movie
    * print "Movie Name: " , movieName
    * match movieName == "Jumanji: Welcome to the Jungle"
