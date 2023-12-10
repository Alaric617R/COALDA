#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

/*
  A simple implementation of binary read & write for .ppm
*/

// 0x20: space, 0x23: hashtag, 0x0a: eol, 0x0d: return
// Idea:
// Skip over the first end of line
// While pointing to a 0x23, skip over the next end of line
// Read width and height, ascii, skip over end of line
// Read max val, ascii. skip over end of line
// Read by byte, store the byte as int to dynamic memory

int *read_ppm(std::string file_name, int &width, int &height) {
  char c;
  width = 0;
  height = 0;
  int max_val = 0;
  std::ifstream ppm_file(file_name, std::ios::binary);
  if (!ppm_file.is_open()) {
    printf("Error opening file!\n");
    return nullptr;
  }
  std::cout << "Skipping first line...\n";
  while (ppm_file.get(c)) {
    if (c == 0x0a) break;
  }
  std::cout << "Skipping comments...\n";
  while (ppm_file.get(c)) {
    if (c == 0x23) {
      while (ppm_file.get(c)) {
        if (c == 0x0a) break;
      }
    } else {
      ppm_file.unget();
      break;
    }
  }
  std::cout << "Reading width...\n";
  while (ppm_file.get(c)) {
    if (c == 0x0d) continue;
    if (c == 0x20 || c == 0x0a) break;
    std::cout << c << '\n';
    width = width * 10 + (c - '0');
  }
  std::cout << "Reading height...\n";
  while (ppm_file.get(c)) {
    if (c == 0x0d) continue;
    if (c == 0x20 || c == 0x0a) break;
    std::cout << c << '\n';
    height = height * 10 + (c - '0');
  }
  std::cout << "Reading max val...\n";
  while (ppm_file.get(c)) {
    if (c == 0x0d) continue;
    if (c == 0x20 || c == 0x0a) break;
    std::cout << c << '\n';
    max_val = max_val * 10 + (c - '0');
  }
  std::cout << "width: " << width << ", height: " << height
            << ", max_val: " << max_val << "\n";
  std::cout << "Allocating mem...\n";
  long long total_rgb = 3 * (long long)width * (long long)height;
  int *result = new int[total_rgb];
  std::cout << "Reading rgb data...\n";
  long long cnt = 0;
  while (true) {
    ppm_file.get(c);
    if (c == 0x0d) {
      char c_next;
      ppm_file.get(c_next);
      if (c_next == 0x0a) {
        continue;
      } else {
        ppm_file.unget();
      }
    }
    result[cnt] = (int)((unsigned char)c);
    // std::cout << "cnt = " << cnt << ", " << result[cnt] << '\n';
    cnt++;
    if (cnt == total_rgb) break;
  }
  ppm_file.close();
  std::cout << "Read ppm succeeded\n";
  return result;
}

void write_ppm(std::string file_name, int *data, int width, int height) {
  std::cout << "Writing result...\n";
  std::ofstream ppm_file(file_name);
  if (!ppm_file.is_open()) {
    printf("Error opening file for writing!\n");
    return;
  }
  ppm_file.put('P');
  ppm_file.put('6');
  ppm_file.put('\r');
  ppm_file.put('\n');
  ppm_file.put('2');
  ppm_file.put('5');
  ppm_file.put('6');
  ppm_file.put(' ');
  ppm_file.put('2');
  ppm_file.put('5');
  ppm_file.put('6');
  ppm_file.put('\r');
  ppm_file.put('\n');
  ppm_file.put('2');
  ppm_file.put('5');
  ppm_file.put('5');
  ppm_file.put('\r');
  ppm_file.put('\n');
  for (int i = 0; i < height * width; i++) {
    ppm_file.put((char)data[3 * i + 0]);
    ppm_file.put((char)data[3 * i + 1]);
    ppm_file.put((char)data[3 * i + 2]);
  }
  ppm_file.close();
  return;
}
