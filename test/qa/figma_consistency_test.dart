void main() {
  test('Design and code are in sync', () {
    final figmaVersion = File('scripts/figma_design_hash.txt').readAsStringSync().trim();
    final currentVersion = File('scripts/local_ui_hash.txt').readAsStringSync().trim();
    expect(currentVersion, equals(figmaVersion));
  });
}
