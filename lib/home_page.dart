import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _showMessage = false;
  String _currentMessage = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> _motivationalMessages = [
  'Acredite no seu potencial!',
  'Você é mais forte do que imagina.',
  'Cada dia é uma nova chance de recomeçar!',
  'Confie no processo. O melhor está por vir.',
  'Você é capaz de coisas incríveis!',
  'Sua jornada é única e valiosa.',
  'Pequenos passos levam a grandes conquistas.',
  'Hoje é o primeiro dia do resto da sua vida.',
  'O sucesso começa com a decisão de tentar.',
  'Nunca é tarde para perseguir seus sonhos.',
  'Seja a mudança que você quer ver no mundo.',
  'Cada desafio é uma oportunidade disfarçada.',
  'A persistência realiza o impossível.',
  'Tenha coragem para seguir seu coração.',
  'Construa o amanhã com as ações de hoje.',
  'Acredite na magia que existe em você.',
  'Faça o que ama e não terá que trabalhar um dia na vida.',
  'O esforço de hoje será a conquista de amanhã.',
  'Sonhe grande, comece pequeno, vá devagar.',
  'O otimismo é a fé que leva à realização.',
  'A gratidão transforma o que temos em suficiente.',
  'Não desista, grandes coisas levam tempo.',
  'A mente é tudo. O que você pensa, você se torna.',
  'A felicidade está no caminho, não no destino.',
  'Desafie seus limites e supere suas expectativas.',
  'Aprenda com o passado, viva no presente, construa o futuro.',
  'Cada pequeno passo te aproxima do sucesso.',
  'Seu único limite é aquele que você impõe a si mesmo.',
  'O poder da ação traz resultados incríveis.',
  'Mantenha o foco, mantenha a fé.',
  'A vida recompensa os corajosos.',
  'Seja gentil consigo mesmo e com os outros.',
  'Vença pelo sorriso, não pela voz alta.',
  'Um dia de cada vez, um passo de cada vez.',
  'Transforme obstáculos em aprendizado.',
  'O melhor ainda está por vir.',
  'Confie no seu potencial infinito.',
  'Cultive pensamentos positivos todos os dias.'
];


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _generateMotivation() {
    final random = Random();
    final newMessage = _motivationalMessages[random.nextInt(_motivationalMessages.length)];
    
    setState(() {
      _currentMessage = newMessage;
      _showMessage = true;
    });
    
    _animationController.reset();
    _animationController.forward();
  }

  void _copyPixKey() async {
    await Clipboard.setData(const ClipboardData(text: '24642660860'));
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Chave PIX copiada! Obrigado pelo apoio ☕'),
          backgroundColor: const Color(0xFF2d89ef),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFb9e8ff),
              Color(0xFFffefdb),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  
                  _buildHeader(),
                  
                  const SizedBox(height: 80),
                  
                  _buildMainButton(),
                  
                  const SizedBox(height: 40),
                  
                  if (_showMessage) _buildMotivationalBanner(),
                  
                  const SizedBox(height: 80),
                  
                  _buildPixButton(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2d89ef).withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/icon-192.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'DAYLIGTH',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2d89ef),
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sua dose diária de motivação',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF2d89ef).withOpacity(0.7),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildMainButton() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 300),
      child: ElevatedButton(
        onPressed: _generateMotivation,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD600),
          foregroundColor: const Color(0xFF2d89ef),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 8,
          shadowColor: const Color(0xFFFFD600).withOpacity(0.3),
        ),
        child: Text(
          'Receber Motivação ✨',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildMotivationalBanner() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 500,
          minHeight: 100,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2d89ef).withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    Icons.format_quote_rounded,
                    size: 40,
                    color: const Color(0xFF2d89ef).withOpacity(0.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _currentMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2d89ef),
                      height: 1.4,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD600),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPixButton() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 320),
      child: OutlinedButton.icon(
        onPressed: _copyPixKey,
        icon: const Icon(
          Icons.coffee_outlined,
          color: Color(0xFF8B4513),
        ),
        label: Text(
          'Pague um café para o desenvolvedor (PIX)',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF2d89ef),
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          side: BorderSide(
            color: const Color(0xFF2d89ef).withOpacity(0.3),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
      ),
    );
  }
}
