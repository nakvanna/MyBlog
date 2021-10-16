import {reactive} from "@vue/composition-api";

export function listPost() {
  const state = reactive({
    post: {
      data: {
        records: [
          {
            title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
              "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
            images: [
              'https://cdn.quasar.dev/img/parallax2.jpg'
            ],
            user: {
              name: "Nak Nanna",
              username: "nakvanna",
              profile: "https://pbs.twimg.com/profile_images/1121942926437666816/Ck65AlxH_400x400.jpg"
            },
            comments: [
              {
                user: {
                  name: "Chorn Khemra",
                  username: "@chornkhemra",
                  profile: "https://cdn.quasar.dev/img/avatar.png"
                },
                comment: "Hello my Crush",
                like: 15,
              },
              {
                user: {
                  name: "Nak Vanna",
                  username: "@nakvanna",
                  profile: "https://cdn.quasar.dev/img/avatar.png"
                },
                comment: "Hello my Crush",
                like: 15,
              }
            ]
          },
          {
            title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
              "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
            images: [
              'https://cdn.quasar.dev/img/parallax2.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
            ],
            user: {
              name: "Chorn Khemra",
              username: "chornkhemra",
              profile: "https://cdn.quasar.dev/img/avatar.png"
            },
            comments: [
              {
                user: {
                  name: "Kon Jrok",
                  username: "@konjrok",
                  profile: "https://cdn.quasar.dev/img/avatar.png"
                },
                comment: "What's that",
                like: 53,
              },
            ]
          },
          {
            title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
              "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
            images: [
              'https://cdn.quasar.dev/img/parallax1.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
            ],
            user: {
              name: "Mjaz Srok",
              username: "mjazsrok",
              profile: "https://cdn.quasar.dev/img/avatar.png"
            },
            comments: [
              {
                user: {
                  name: "Mjaz Srok",
                  username: "@mjazsrok",
                  profile: "https://cdn.quasar.dev/img/avatar.png"
                },
                comment: "Want to see more",
                like: 15,
              },
              {
                user: {
                  name: "Nak Vanna",
                  username: "@nakvanna",
                  profile: "https://pbs.twimg.com/profile_images/1121942926437666816/Ck65AlxH_400x400.jpg"
                },
                comment: "What are u doing?",
                like: 56,
              },
              {
                user: {
                  name: "Mii Love",
                  username: "@miilove",
                  profile: "https://cdn.quasar.dev/img/avatar.png"
                },
                comment: "Okay kayoo",
                like: 20,
              }
            ]
          },
          {
            title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
              "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
            images: [
              'https://cdn.quasar.dev/img/parallax1.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
            ],
            user: {
              name: "Mjaz Srok",
              username: "mjazsrok",
              profile: "https://cdn.quasar.dev/img/avatar.png"
            },
            comments: []
          },
          {
            title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
              "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
            images: [
              'https://cdn.quasar.dev/img/parallax1.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
              'https://cdn.quasar.dev/img/mountains.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
              'https://cdn.quasar.dev/img/parallax2.jpg',
            ],
            user: {
              name: "Mjaz Srok",
              username: "mjazsrok",
              profile: "https://cdn.quasar.dev/img/avatar.png"
            },
            comments: []
          },
        ]
      }
    }
  })
  const md = {}
  return {
    state,
    md
  }
}
