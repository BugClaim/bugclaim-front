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
# File: projects/create/create-project-members-restrictions/create-project-members-restrictions.directive.coffee
###

module = angular.module("taigaProject")

createProjectMembersRestrictionsDirective = () ->
    return {
        scope: {
            isPrivate: '=',
            limitMembersPrivateProject: '=',
            limitMembersPublicProject: '='
        },
        templateUrl: "projects/create/create-project-members-restrictions/create-project-members-restrictions.html"
    }

module.directive('tgCreateProjectMembersRestrictions', [createProjectMembersRestrictionsDirective])
