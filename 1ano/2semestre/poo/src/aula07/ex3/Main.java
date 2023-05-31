package aula07.ex3;

import java.util.Scanner;

public class Main {
    public static final Scanner sin = new Scanner(System.in);
    public static Team[] teams;
    public static Game[] games;


    public static void main(String[] args) {
        while (true) {
            int option = menu();
            switch (option) {
                case 0 -> {
                    sin.close();
                    System.exit(0);
                }
                case 1 -> createTeam();
                case 2 -> listTeams();
                case 3 -> listRobots();
                case 4 -> createGame();
                case 5 -> listGames();
                default -> System.out.println("Opção inválida!");
            }
        }
    }

    private static void listGames() {
        for (Game g : games)
            System.out.println(g);
    }

    private static void createGame() {
        if (teams == null || teams.length < 2) {
            System.out.println("Não existem equipas suficientes para criar um jogo!");
            return;
        }
        System.out.println("Equipas:");
        for (int i = 0; i < teams.length; i++)
            System.out.println((i + 1) + " - " + teams[i].getName());
        System.out.print("Escolha a equipa 1: ");
        int team1Id = Integer.parseInt(sin.nextLine());
        System.out.print("Escolha a equipa 2: ");
        int team2Id = Integer.parseInt(sin.nextLine());
        Team team1 = teams[team1Id - 1];
        Team team2 = teams[team2Id - 1];
        System.out.println("Bola para o jogo:");
        System.out.print("Cor da bola: ");
        String color = sin.nextLine();
        System.out.print("X inicial: ");
        String xString = sin.nextLine();
        double ballX = Double.parseDouble(xString.equals("") ? "0" : xString);
        System.out.print("Y inicial: ");
        String yString = sin.nextLine();
        double ballY = Double.parseDouble(yString.equals("") ? "0" : yString);
        Ball ball = new Ball(ballX, ballY, color);
        System.out.println("Duração do jogo (minutos): ");
        String durationString = sin.nextLine();
        double duration = Double.parseDouble(durationString.equals("") ? "90" : durationString);
        Game game = new Game(team1, team2, ball, duration);
        if (games == null)
            games = new Game[]{game};
        else {
            Game[] newGames = new Game[games.length + 1];
            System.arraycopy(games, 0, newGames, 0, games.length);
            newGames[games.length] = game;
            games = newGames;
        }
        game.start();
        new Thread(() -> {
            while (game.getTimeElapsed() < game.getGameDuration()) {
                System.out.println("1 - Mover bola");
                System.out.println("2 - Mover robot");
                System.out.println("3 - Adicionar golo");
                System.out.print("Opção: ");
                int option = Integer.parseInt(sin.nextLine());
                swit:
                switch (option) {
                    case 1 -> {
                        System.out.print("Novo X: ");
                        double x = Double.parseDouble(sin.nextLine());
                        System.out.print("Novo Y: ");
                        double y = Double.parseDouble(sin.nextLine());
                        ball.move(x, y);
                    }
                    case 2 -> {
                        System.out.println("Robots:");
                        for (Robot r : game.getTeam1().getRobots())
                            System.out.println(r);
                        for (Robot r : game.getTeam2().getRobots())
                            System.out.println(r);
                        System.out.print("Escolha o ID do robot: ");
                        int robotId = Integer.parseInt(sin.nextLine());
                        System.out.print("Novo X: ");
                        double x = Double.parseDouble(sin.nextLine());
                        System.out.print("Novo Y: ");
                        double y = Double.parseDouble(sin.nextLine());
                        game.moveRobot(robotId, x, y);
                    }
                    case 3 -> {
                        System.out.println("Robots:");
                        System.out.println(game.getTeam1());
                        System.out.println(game.getTeam2());

                        System.out.print("Escolha o ID do robot que marcou: ");
                        int robotId = Integer.parseInt(sin.nextLine());
                        for (Robot r : game.getTeam1().getRobots())
                            if (r.getId() == robotId) {
                                game.addGoal(game.getTeam1(), robotId);
                                break swit;
                            }
                        for (Robot r : game.getTeam2().getRobots())
                            if (r.getId() == robotId) {
                                game.addGoal(game.getTeam2(), robotId);
                                break swit;
                            }
                    }
                    default -> System.out.println("Opção inválida!");
                }
            }
        });
    }

    private static void listRobots() {
        if (teams == null || teams.length == 0) {
            System.out.println("Não existem equipas!");
            return;
        }
        for (Team t : teams) {
            System.out.println("Equipa " + t.getName());
            for (Robot r : t.getRobots())
                System.out.println(r);
        }
    }

    private static void listTeams() {
        if (teams == null || teams.length == 0) {
            System.out.println("Não existem equipas!");
            return;
        }
        for (Team t : teams)
            System.out.println(t);
    }

    private static void createTeam() {
        System.out.print("Nome da equipa: ");
        String name = sin.nextLine();
        System.out.print("Treinador: ");
        String coach = sin.nextLine();
        System.out.print("Número de robots: ");
        int nRobots = Integer.parseInt(sin.nextLine());
        Robot[] robots = new Robot[nRobots];
        for (int i = 0; i < nRobots; i++) {
            System.out.println("Robot " + (i + 1));
            System.out.print("\n1 - GoalKeeper\n2 - Defender\n3 - Midfielder\n4 - Striker\nPosição: ");
            PlayerPosition position = PlayerPosition.getPositionById(Integer.parseInt(sin.nextLine()));
            System.out.print("X inicial: ");
            String xString = sin.nextLine();
            double x = Double.parseDouble(xString.equals("") ? "0" : xString);
            System.out.print("Y inicial: ");
            String yString = sin.nextLine();
            double y = Double.parseDouble(yString.equals("") ? "0" : yString);
            robots[i] = new Robot(x, y, position);
        }
        Team team = new Team(name, coach, robots);
        if (teams == null)
            teams = new Team[]{team};
        else {
            Team[] newTeams = new Team[teams.length + 1];
            System.arraycopy(teams, 0, newTeams, 0, teams.length);
            newTeams[teams.length] = team;
            teams = newTeams;
        }
    }

    private static int menu() {
        System.out.println("1. Criar equipa");
        System.out.println("2. Listar equipas");
        System.out.println("3. Listar robots");
        System.out.println("4. Criar jogo");
        System.out.println("5. Listar jogos");
        System.out.println("0. Sair");
        System.out.print("> ");

        return Integer.parseInt(sin.nextLine());
    }
}
