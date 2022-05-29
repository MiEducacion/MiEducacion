const CoursesHome = () => import( /* webpackChunkName: "mieducacion-courses-home" */ '../views/courses/CoursesHome.vue')
const CoursesBase = () => import( /* webpackChunkName: "mieducacion-course-overview" */ '../views/courses/CoursesBase.vue')

const SingleCourseBase = () => import( /* webpackChunkName: "mieducacion-course-base" */ '../views/courses/components/SingleCourseBase.vue')
const CourseOverview = () => import( /* webpackChunkName: "mieducacion-course-overview" */ '../views/courses/components/CourseOverview.vue')



let CoursesHomeRoute = {
    path: '/courses',
    component: CoursesBase,
    children: [
        {
            name: 'courses',
            path: '',
            component: CoursesHome
        },
        {
            path: ':id',
            component: SingleCourseBase,
            redirect: ':id/overview',
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