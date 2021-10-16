import {boot} from "quasar/wrappers";
import {LocalStorage} from 'quasar'
// @ts-ignore
import {LOGIN_INFO_KEY} from "src/helpers/utils";

export default boot(({router}) => {
  let userInfo = LocalStorage.getItem(LOGIN_INFO_KEY)
  router.beforeEach(async (to, from, next) => {
    if (to.meta['requireAuth']) {
      if (!userInfo) {
        next('/login')
      } else {
        next()
      }
    } else {
      if (userInfo) {
        next('/')
      } else {
        next()
      }
    }
  });
});
