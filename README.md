# Spacial Probe

A NASA explorer probe has landed on Mars. The landing took place in a rectangular area, with the spacecraft can navigate using the input array moviments. The position of the ponted probe is by it's x and it's position indicated by the initial latter, the specifications being valid:

- `L` - Left
- `R` - Right
- `U` - Up
- `D` - Down

The probe accept 3 commands:

- `TL` - Turn Left
- `TR` - Turn Right
- `M` - Move

> OBS: For each `M` command, the probe moves one position in the direction it's face is pointed

The probe starts in the quadrant (x = 0, y = 0), which translates to the lower left house and starts with the face to right. If we could see the initial position of the probe, we would have:

| (0,4) |  (1,4) | (2,4) |  (3,4) | (4,4) |
|:-----:|  ----  |  ---- |  ----  |  ---- |
| (0,3) |  (1,3) | (2,3) |  (3,3) | (4,3) |
| (0,2) |  (1,2) | (2,2) |  (3,2) | (4,2) |
| (0,1) |  (1,1) | (2,1) |  (3,1) | (4,1) |
| * >   |  (1,0) | (2,0) |  (3,0) | (4,0) |

`* Indicate initial position of the probe`

### Rules

The intention is to control the probe by sending the direction and amount of movements it must perform. The answer must be its final coordinate if the point is inside the quadrant, if the point cannot be reached the answer must be an error indicating that the position is invalid. For running the test the dimensions of 5x5 can be used.

Any movement outside the quadrant will show the message `Invalid movement, our probe cannot fly yet`

### Setup

Build container with:

```bash
docker-compose build
```

Up container with:

```bash
docker-compose up
```

Access on http://localhost:4000