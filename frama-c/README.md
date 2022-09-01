# Installing
```
docker run framac/frama-c:25.0 frama-c --help
```

## Hello world
```
docker run -v $(pwd):/working -w /working framac/frama-c:25.0 frama-c -eva rte.c
```
## Dijkstra's Weakest Precondition Calculus
```
docker run -v $(pwd):/working -w /working framac/frama-c:25.0 frama-c -wp introduction_acsl.c
```

## Frama-c Manual
http://frama-c.com/download/frama-c-value-analysis.pdf
