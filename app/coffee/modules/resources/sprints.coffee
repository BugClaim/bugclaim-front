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
# File: modules/resources/sprints.coffee
###

taiga = @.taiga

generateHash = taiga.generateHash

resourceProvider = ($repo, $model, $storage, $http, $urls) ->
    service = {}

    service.get = (projectId, sprintId) ->
        return $repo.queryOne("milestones", sprintId).then (sprint) ->
            uses = sprint.user_stories
            uses = _.map(uses, (u) -> $model.make_model("userstories", u))
            sprint._attrs.user_stories = uses
            return sprint

    service.stats = (projectId, sprintId) ->
        return $repo.queryOneRaw("milestones", "#{sprintId}/stats")

    service.list = (projectId, filters) ->
        params = {"project": projectId}
        params = _.extend({}, params, filters or {})
        return $repo.queryMany("milestones", params, {}, true).then (result) =>
            milestones = result[0]
            headers = result[1]

            for m in milestones
                uses = m.user_stories
                uses = _.map(uses, (u) => $model.make_model("userstories", u))
                m._attrs.user_stories = uses

            return {
                milestones: milestones,
                closed: parseInt(headers("Bugclaim-Info-Total-Closed-Milestones"), 10),
                open: parseInt(headers("Bugclaim-Info-Total-Opened-Milestones"), 10)
            }

    service.moveUserStoriesMilestone = (currentMilestoneId, projectId, milestoneId, data) ->
        url = $urls.resolve("move-userstories-to-milestone", currentMilestoneId)
        params = {project_id: projectId, milestone_id: milestoneId, bulk_stories: data}
        return $http.post(url, params)

    service.moveTasksMilestone = (currentMilestoneId, projectId, milestoneId, data) ->
        url = $urls.resolve("move-tasks-to-milestone", currentMilestoneId)
        params = {project_id: projectId, milestone_id: milestoneId, bulk_tasks: data}
        return $http.post(url, params)

    service.moveIssuesMilestone = (currentMilestoneId, projectId, milestoneId, data) ->
        url = $urls.resolve("move-issues-to-milestone", currentMilestoneId)
        params = {project_id: projectId, milestone_id: milestoneId, bulk_issues: data}
        return $http.post(url, params)

    return (instance) ->
        instance.sprints = service

module = angular.module("taigaResources")
module.factory("$tgSprintsResourcesProvider",
["$tgRepo", "$tgModel", "$tgStorage", "$tgHttp", "$tgUrls", resourceProvider])
