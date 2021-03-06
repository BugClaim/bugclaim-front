###
# Copyright (C) 2014-present Bugclaim Agile LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: services/error-handling.service.coffee
###

taiga = @.taiga

class ErrorHandlingService
    @.$inject = [
        "$rootScope"
    ]

    constructor: (@rootScope) ->

    init: () ->
        @rootScope.errorHandling = {}

    notfound: ->
        @rootScope.errorHandling.showingError = true
        @rootScope.errorHandling.notfound = true

    error: ->
        @rootScope.errorHandling.showingError = true
        @rootScope.errorHandling.error = true

    permissionDenied: ->
        @rootScope.errorHandling.showingError = true
        @rootScope.errorHandling.permissionDenied = true

    block: ->
        @rootScope.errorHandling.showingError = true
        @rootScope.errorHandling.blocked = true

angular.module("taigaCommon").service("tgErrorHandlingService", ErrorHandlingService)
