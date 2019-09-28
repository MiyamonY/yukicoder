// Package main provides
//
// File:  main.go
// Author: ymiyamoto
//
// Created on Sun Sep 29 02:05:32 2019
//
package main

import (
	"bufio"
	"container/heap"
	"fmt"
	"os"
	"strconv"
)

type pq []int

func (p pq) Len() int {
	return len(p)
}

func (p pq) Swap(i, j int) {
	p[i], p[j] = p[j], p[i]
}

func (p pq) Less(i, j int) bool {
	return p[i] > p[j]
}

func (p *pq) Pop() interface{} {
	n := len(*p)
	x := (*p)[n-1]
	*p = (*p)[:n-1]
	return x
}

func (p *pq) Push(x interface{}) {
	v, _ := x.(int)
	*p = append(*p, v)
}

var sc = bufio.NewScanner(os.Stdin)

func nextInt() int {
	sc.Scan()
	i, e := strconv.Atoi(sc.Text())
	if e != nil {
		panic(e)
	}
	return i
}

func main() {
	sc.Split(bufio.ScanWords)

	n := nextInt()
	p := make(pq, n)
	sum := 0
	for i := 0; i < n; i++ {
		p[i] = nextInt()
		sum += p[i]
	}
	heap.Init(&p)
	q := nextInt()
	for i := 0; i < q; i++ {
		x := nextInt()
		n, _ := heap.Pop(&p).(int)
		for x <= n {
			heap.Push(&p, n%x)
			sum -= n
			sum += n % x
			n, _ = heap.Pop(&p).(int)
		}
		heap.Push(&p, n)
		fmt.Println(sum)
	}
}
