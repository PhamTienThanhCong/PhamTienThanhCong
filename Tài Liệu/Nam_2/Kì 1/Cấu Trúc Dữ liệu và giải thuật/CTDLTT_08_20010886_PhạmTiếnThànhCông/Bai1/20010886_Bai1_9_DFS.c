// This is the code of Pham Tien Thanh Cong - 20010886
#include<stdio.h>
#include<stdlib.h>
#define MAX 100

int G[MAX][MAX], n, source;
int visited[MAX];

void readData(char *filename, int G[MAX][MAX], int *pn, int *psource){
	FILE* file = fopen(filename,"r");
	int i, j;
	if(file != NULL){
		fscanf(file, "%d %d", pn, psource);
		for(i = 0; i < *pn; i++)
			for(j = 0; j < *pn; j++)
				fscanf(file, "%d", &G[i][j]);
	}
		fclose(file);
}

void DepthFirstSearch(int v){
	int w;
	
	//mark cur as visited;
	visited[v] = 1;
	printf(" %d", v);
	
	for(w = 0; w < n; w++){
		if(G[v][w] != 0 && visited[w] == 0){
			visited[w] = 1;
			DepthFirstSearch(w);
		}
	}	
}

// This is the code of Pham Tien Thanh Cong - 20010886
int main(){	
	readData("20010886_Bai1_9_DFS.txt", G, &n, &source);
	int i;
	for(i=0; i<n; i++)
		visited[i] = 0;
	DepthFirstSearch(source);
}
// This is the code of Pham Tien Thanh Cong - 20010886