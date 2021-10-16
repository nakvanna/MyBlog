
export interface UserModel {
  id?: string | any
  profile?: string | any
  name?: string | any
  username?: string | any
  email?: string | any
  password?: string | any
  password_confirmation?: string | any
  role?: string | any
  verify?: string | any
}

export interface LoginUserModel {
  email_or_username?: string | any
  password?: string | any
}
