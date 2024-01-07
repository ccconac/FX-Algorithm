import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;
import java.util.Arrays;
import java.util.stream.Collectors;

class Solution {
    public int[][] solution(int[][] data, String ext, int val_ext, String sort_by) {

        int extIdx = 0;
        switch(ext){
            case "date" -> extIdx = 1;
            case "maximum" -> extIdx = 2;
            case "remain" -> extIdx = 3;
        }

        int sortValIdx = 0;
        switch(sort_by){
            case "date" -> sortValIdx = 1;
            case "maximum" -> sortValIdx = 2;
            case "remain" -> sortValIdx = 3;
        }

        List<List<Integer>> dataList = new ArrayList<>();   // 조건을 만족하는 데이터를 담을 리스트
        List<Integer> sortValList = new ArrayList<>();  // 정렬될 값을 담을 리스트
        for(int[] row : data){
            if(row[extIdx] < val_ext){
                // 기본형 배열 -> 리스트
                List<Integer> rowList = Arrays.stream(row)
                        .boxed()
                        .collect(Collectors.toList());
                dataList.add(rowList);
                sortValList.add(row[sortValIdx]);
            }
        }

        sortValList.sort(Comparator.naturalOrder());

        int[][] answer = new int[sortValList.size()][4];
        int i = 0;
        for(int sortedVal : sortValList){
            for(List<Integer> list : dataList){
                if(list.get(sortValIdx) == sortedVal){
                    // 리스트 -> 기본형 배열
                    answer[i] = list.stream().mapToInt(Integer::intValue).toArray();
                    i++;
                    break;
                }
            }
        }
        return answer;
    }
}