const CoursesHome = () => import( /* webpackChunkName: "mieducacion-courses-home" */ '../views/courses/CoursesHome.vue')

const SingleCourseBase = () => import( /* webpackChunkName: "mieducacion-course-base" */ '../views/courses/components/SingleCourseBase.vue')
const CourseOverview = () => import( /* webpackChunkName: "mieducacion-course-overview" */ '../views/courses/components/CourseOverview.vue')



let CoursesHomeRoute = {
    path: '/courses',
    component: CoursesHome,
    name: 'courses.home',
    children: [
        {
            path: '/courses/:id',
            component: SingleCourseBase,
            redirect: '/courses/:id/overview',
            children: [
                {
                    name: 'course.overview',
                    path: 'overview',
                    component: CourseOverview
                }
            ]
        }
    ]
 }

 
 export default CoursesHomeRoute