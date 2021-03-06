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
# File: history/history-tabs/history-tabs.directive.coffee
###

module = angular.module('taigaHistory')

HistoryTabsDirective = () ->
    return {
        templateUrl:"history/history-tabs/history-tabs.html",
        scope: {
            showCommentTab: "&",
            showActivityTab: "&"
            onActiveComments: "&",
            onActiveActivities: "&",
            onOrderComments: "&"
            activeTab: "<",
            commentsNum: "<",
            activitiesNum: "<",
            onReverse: "<"
        }
    }

module.directive("tgHistoryTabs", HistoryTabsDirective)
