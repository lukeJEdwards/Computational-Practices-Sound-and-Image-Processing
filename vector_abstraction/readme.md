# Project 1: Vector Abstraction

For this project, I decided to look at Anni Albers and her textiles designs throughout the 20th century focusing more around her work with the composition of triangles. The works below are what I took inspiration from in particular the second movement set. This set really caught my eye as it seemed like it could be reproduced, using one of my favourite procedural generation functions, Perlin noise as there was alot of cohesion between the triangles and not compelet randomness.

| Links to work                                      | Main focus                              |
| -------------------------------------------------- | --------------------------------------- |
| TR I & TR II, 1969                                 | second movement I or second movement VI |
| Intaglio with Triangles Album Exacta 105/125, 1973 |                                         |
| DR XVI (B), 1974                                   |                                         |
| Fox II, 1972                                       |                                         |

#### <ins>How to run & interact</ins>

- Open in processing and press play.
- Use **W, A, S, D** key to interact.

#### <ins>Process</ins>

I first made a grid of right angle triangles to imitate the work then using the built-in noise function in processing generated the sudo randomness giving a new combonation of triangles to look at each time you ran the program. I then decided to connect that to a mouse click so the viewer could change it while it was running.

After that I then had the idea to move the work though noise space making it seem like the piece was in it's own world. I did this by storing both the visual and noise space positions in different variables the using the **W, A, S, D** keys for movment.
