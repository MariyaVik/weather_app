// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJuYW1lIjoi0JrRgNC40YHRgtC40L3QsCIsInN1cm5hbWUiOiLQkNC00LDQvNC-0LLQsCIsIm5pY2tuYW1lIjoia3Jpc19hZCIsImltYWdlX3VybCI6Imh0dHBzOi8vaTN2ZXN0bm8ucnUvaW1hZ2VzLzIwMjIvMDUvMTkvMTJkOTVmYjdhNTlmNDliYzljMzBlNGQxYTk4M2ViYzEuanBnIn0.ynTlOs3T0VBo8vYCpVGj28wWB0tGoJH_2yxjOl-nQ34
// {
// "id":"1",
// "name": "Кристина",
// "surname":"Адамова",
// "nickname":"kris",
// "image_url":"https://i3vestno.ru/images/2022/05/19/12d95fb7a59f49bc9c30e4d1a983ebc1.jpg",
// }

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIiLCJuYW1lIjoi0JzQuNGF0LDQuNC7Iiwic3VybmFtZSI6ItCW0LDQutC-0LIiLCJuaWNrbmFtZSI6Im1pY2siLCJpbWFnZV91cmwiOiJodHRwczovL2ltZy5nb29kZm9uLnJ1L29yaWdpbmFsLzIwNDh4MTU1OC9iL2RkL3ZlbG9zaXBlZGlzdC1zcG9ydHNtZW4tZ29yeS1wcmlyb2RhLWRvcm9nYS1yb2FkLWJpa2UuanBnIn0.a1_8tGe4JrKCMCcuPaQDli38A6iMQhqCo3QPFlrVW2U
// {
// "id":"2",
// "name": "Михаил",
// "surname":"Жаков",
// "nickname":"mick",
// "image_url":"https://img.goodfon.ru/original/2048x1558/b/dd/velosipedist-sportsmen-gory-priroda-doroga-road-bike.jpg",
// }

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMiLCJuYW1lIjoi0JzQsNGA0LoiLCJzdXJuYW1lIjoi0JLQsNGB0LjQu9GM0LXQsiIsIm5pY2tuYW1lIjoibWFya183NzciLCJpbWFnZV91cmwiOiJodHRwczovLzR0b2xvbG8ucnUvc2l0ZXMvZGVmYXVsdC9maWxlcy9pbmxpbmUtaW1hZ2VzLzIwMjIvMDIvMDItMTYtNTItMTY0NTcxMDc3MjE2NjI4MDgzNDMuanBnIn0.fj1lKWuS8boaeGX1-5_Z3YPe7X6690b__yNTK2pLVVQ
// {
// "id":"3",
// "name": "Марк",
// "surname":"Васильев",
// "nickname":"mark",
// "image_url":"https://4tololo.ru/sites/default/files/inline-images/2022/02/02-16-52-16457107721662808343.jpg",
// }

const List<Map<String, String>> mokUsers = [
  {
    'login': 'kris',
    'password': '123',
    'access_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJuYW1lIjoi0JrRgNC40YHRgtC40L3QsCIsInN1cm5hbWUiOiLQkNC00LDQvNC-0LLQsCIsIm5pY2tuYW1lIjoia3Jpc19hZCIsImltYWdlX3VybCI6Imh0dHBzOi8vaTN2ZXN0bm8ucnUvaW1hZ2VzLzIwMjIvMDUvMTkvMTJkOTVmYjdhNTlmNDliYzljMzBlNGQxYTk4M2ViYzEuanBnIn0.ynTlOs3T0VBo8vYCpVGj28wWB0tGoJH_2yxjOl-nQ34',
  },
  {
    'login': 'mick',
    'password': '123',
    'access_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIiLCJuYW1lIjoi0JzQuNGF0LDQuNC7Iiwic3VybmFtZSI6ItCW0LDQutC-0LIiLCJuaWNrbmFtZSI6Im1pY2siLCJpbWFnZV91cmwiOiJodHRwczovL2ltZy5nb29kZm9uLnJ1L29yaWdpbmFsLzIwNDh4MTU1OC9iL2RkL3ZlbG9zaXBlZGlzdC1zcG9ydHNtZW4tZ29yeS1wcmlyb2RhLWRvcm9nYS1yb2FkLWJpa2UuanBnIn0.a1_8tGe4JrKCMCcuPaQDli38A6iMQhqCo3QPFlrVW2U',
  },
  {
    'login': 'mark',
    'password': '123',
    'access_token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMiLCJuYW1lIjoi0JzQsNGA0LoiLCJzdXJuYW1lIjoi0JLQsNGB0LjQu9GM0LXQsiIsIm5pY2tuYW1lIjoibWFya183NzciLCJpbWFnZV91cmwiOiJodHRwczovLzR0b2xvbG8ucnUvc2l0ZXMvZGVmYXVsdC9maWxlcy9pbmxpbmUtaW1hZ2VzLzIwMjIvMDIvMDItMTYtNTItMTY0NTcxMDc3MjE2NjI4MDgzNDMuanBnIn0.fj1lKWuS8boaeGX1-5_Z3YPe7X6690b__yNTK2pLVVQ',
  },
];
