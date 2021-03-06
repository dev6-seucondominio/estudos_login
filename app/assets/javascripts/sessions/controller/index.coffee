angular.module 'PersonalManagementCtr'

.controller 'Sessions::IndexCtrl', [
  '$scope'
  'Sessions'
  ($s, Sessions)->
    $s.sessionsCtrl =
      init: ->
        @params =
          email: ''
          password: ''

      valid: ->
        is_valid = true
        @errors = {}

        if @params.email == ''
          is_valid = false
          @errors.email = true

        if @params.password == ''
          is_valid = false
          @errors.password = true

        is_valid

      create: ->
        return unless @valid()

        Sessions.create @params,
          (data)->
            window.location.reload()
          (response)->
            alert(response)
]
