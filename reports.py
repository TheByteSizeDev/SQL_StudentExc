import sqlite3

class Student():

    def __init__(self, first, last, handle, cohort):
        self.first_name = first
        self.last_name = last
        self.slack_handle = handle
        self.cohort = cohort

class StudentExerciseReports():

    """Methods for reports on the Student Exercises database"""

    def __init__(self):
        self.db_path = "/Users/sydneynoh/Workspace/back-end/studentExercises/studentexercises.db"

    def all_students(self):

        """Retrieve all students with the cohort name"""

        with sqlite3.connect(self.db_path) as conn:
            db_cursor = conn.cursor()

            db_cursor.execute("""
            select s.Id,
                s.First_Name,
                s.Last_Name,
                s.Slack_Handle,
                s.CohortId,
                c.Name
            from Students s
            join Cohorts c on s.CohortId = c.Id
            order by s.CohortId
            """)

            all_students = db_cursor.fetchall()

            for student in all_students:
                print(f'{student[1]} {student[2]} is in {student[5]}')

reports = StudentExerciseReports()
reports.all_students()