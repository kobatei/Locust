from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    def on_start(self):
        pass

    @task
    def health(self):
        self.client.request("GET", "/ping", name="Health", catch_response=False,
                            params={},
                            headers={"Content-Type": "application/json"})


class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 1000
    max_wait = 25000