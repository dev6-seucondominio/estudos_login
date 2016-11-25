angular.module 'PersonalManagementCtr'

.factory 'Sessions', [
  '$resource'
  ($resource)->
    encapsulateData = (data) ->
      return JSON.stringify { 'sessions': data }

    $resource 'sessions/:id/.json', { id: '@id' },
      create:
        method: 'POST'
        transformRequest: encapsulateData
]
