angular.module 'PersonalManagementCtr'

.controller 'Home::IndexCtrl', [
  '$scope'
  ($s)->
    $s.people = [
      { name: 'Diego',  birthday: '1996-09-29', age: 20 }
      { name: 'David',  birthday: '1999-04-02', age: 17 }
      { name: 'Fulano', birthday: '1993-04-08', age: 23 }
    ]

    $s.formPerson =
      valid: ->
        return false unless @params?

        return false if @params.name == ''
        return false if @params.age == ''
        return false if @params.birthday == ''

        true
      addPeople: ->
        return if !@valid()

        $s.people.push @params
        @params = {}
]
